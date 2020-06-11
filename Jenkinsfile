pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = "eu-west-1"
        BACKEND_BUCKET        = "corebucket-668785795"
    }
    
    parameters {
        choice(
            name: 'Action',
            choices: ['Build', 'Destroy'],
            description: 'The action to take'
        )
    }
    
    stages {
        stage('Init') {
            steps {
                terraformInit()
            }
        }
        stage('Plan') {
            steps {
                terraformPlan()
            }
        }
        stage('Approval') {
            steps {
                input(message: 'Apply Terraform ?')
            }
        }
        stage('Apply') {
            steps {
                terraformApply()
            }
        }
    }
    post { 
        always { 
            deleteDir()
        }
    }
}

def terraformInit() {
    sh("""
        cd Terraform/Demo;
        terraform init -backend-config="bucket=${env.BACKEND_BUCKET}"
    """)
}

def terraformPlan() {
    // Setting Terraform Destroy flag
    if(params.Action == 'Destroy') {
        env.DESTROY = '-destroy'
    } else {
        env.DESTROY = ""
    }

    sh("""
        cd Terraform/Demo;
        terraform plan ${env.DESTROY} -no-color -out=tfout
    """)
}

def terraformApply() {
    sh("""
        cd Terraform/Demo;
        terraform apply tfout -no-color
    """)
}
