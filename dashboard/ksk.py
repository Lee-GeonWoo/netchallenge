from flask import Flask, render_template, redirect, request, json
from kubernetes import client, config
import requests
from flask_cors import CORS
import subprocess

app = Flask(__name__)
CORS(app)

core_pod_data_list=[]
core_pod_info_list=[]
edge_pod_data_list=[]
edge_pod_info_list=[]
vm_data_list=[]

#result = subprocess.check_output('kubectl get po -n weave |awk \'{print $1}\'' , shell =True).decode("UTF-8").split("\n")
#result = subprocess.check_output('kubectl get po -n weave -o wide  |awk \'{print $1; print $7}\' |cut -d \'-\' -f1 | sed \'1,2d\'' , shell =True).decode("UTF-8").split("\n")

config.load_kube_config()

@app.route('/')
@app.route('/core')
def Base():
    core_pod_data_list=[]
    edge1_pod_data_list=[]
    edge2_pod_data_list=[]
    edge3_pod_data_list=[]

    contexts, active_context = config.list_kube_config_contexts()

    if not contexts:
        print("Cannot find any context in kube-config file.")
        return

    contexts = [context['name'] for context in contexts]

    cluster1 = contexts[0]
    cluster2 = contexts[1]
    # 클러스터 추가 


    client1 = client.CoreV1Api(
        api_client=config.new_client_from_config(context=cluster1))
    client2 = client.CoreV1Api(
        api_client=config.new_client_from_config(context=cluster2))
    # 클라이언트 추가 


    def getnodeLevel(label):
        if(label == 'node2'):
            return 6
        else:
            return 2

    core = client1.list_pod_for_all_namespaces(watch=False)
    edge1 = client2.list_pod_for_all_namespaces(watch=False)
    ####
    for i in core.items:
        core_pod_data_list.append({
            'id': i.metadata.name,
            'node': i.spec.node_name,
            'namespace': i.metadata.namespace,
            'image':  (i.spec.containers)[0].image
        })

    for i in edge1.items:
        edge1_pod_data_list.append({
            'id': i.metadata.name,
            'node': i.spec.node_name,
            'namespace': i.metadata.namespace,
            'image':  (i.spec.containers)[0].image
        })


    ################################

    return render_template('core.html', cluster1=cluster1, cluster2=cluster2, core_pod_data_list=core_pod_data_list, edge1_pod_data_list=edge1_pod_data_list)

@app.route('/create_pod', methods=['POST'])
def createpod():
    pod_name = request.form['pod_name']
    pod_description = request.form['pod_description']

    print(pod_name + ", " + pod_description)
    a = "cat <<EOF>"+pod_name+"\n"+pod_description+"\nEOF"
    subprocess.call(a, shell=True)
    b="kubectl apply -f " + pod_name
    print(b)
    subprocess.call(b, shell=True)
    return redirect('/')

@app.route('/edge1', methods=['GET', 'POST'])
def edge1():
    core_pod_data_list=[]
    edge1_pod_data_list=[]
    edge2_pod_data_list=[]
    edge3_pod_date_list=[]

    contexts, active_context = config.list_kube_config_contexts()

    if not contexts:
        print("Cannot find any context in kube-config file.")
        return

    contexts = [context['name'] for context in contexts]

    cluster1 = contexts[0]
    cluster2 = contexts[1]
    #####
    client1 = client.CoreV1Api(
        api_client=config.new_client_from_config(context=cluster1))
    client2 = client.CoreV1Api(
        api_client=config.new_client_from_config(context=cluster2))
#####
    def getnodeLevel(label):
        if(label == 'node2'):
            return 6
        else:
            return 2

    core = client1.list_pod_for_all_namespaces(watch=False)
    edge1 = client2.list_pod_for_all_namespaces(watch=False)

    for i in core.items:
        core_pod_data_list.append({
            'id': i.metadata.name,
            'node': i.spec.node_name,
            'namespace': i.metadata.namespace,
            'image':  (i.spec.containers)[0].image
        })

    for i in edge1.items:
        edge1_pod_data_list.append({
            'id': i.metadata.name,
            'node': i.spec.node_name,
            'namespace': i.metadata.namespace,
            'image':  (i.spec.containers)[0].image
        })


    return render_template('edge1.html', cluster1=cluster1, cluster2=cluster2, core_pod_data_list=core_pod_data_list, edge1_pod_data_list=edge1_pod_data_list)



if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=5001)
