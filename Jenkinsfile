pipeline {
    agent any 
    
     environment {
                WORKSPACE=pwd()
                ETAG=''
                KOPS_STATE_STORE="s3://valuesource-kubernetes"
                CLUSTER_NAME="value-source-cloud.com"

    }
    stages {
        stage('Build'){
            steps{
                sh 'echo This build machine or docker container needs Kubectl, Kops, and aws cli installed.'
                sh 'echo This build machine has to have ssh keys generated using ssh-keygen -t rsa .'
                sh 'echo building...'
                git url: 'https://github.com/dancurrotto/dotnet-core-simple.git'
            }
        }
        stage('Deploy') {
            steps {
                
                sh 'echo $WORKSPACE'
                sh 'echo $AWS_ACCESS_KEY_ID'
              
                sh 'echo $PATH'            
                
                
                sh '/var/lib/jenkins/workspace/kops-flow/manageClusterWithKops.sh $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY'
               
                             

                // This is the statement that created the cluster.
                // sh 'kops create cluster $NAME --zones us-east-2a --node-count 1 --node-size m4.large --kubernetes-version v1.6.6 --master-size m4.large --dry-run -o yaml > $NAME.yaml'
                //*********************************************************************


                
            }
            
        }
    }
}