pipeline {
   agent any
      stages {
       stage('Checkout') {
         steps {
            git 'https://github.com/BobiAndreevski/fooproject'
                }
                  }
    stage('Build') {
      steps {
        sh "mvn compile"
         }
           }
       stage('Test') {
        steps {
          sh "mvn test"
            }
            // Testar att skicka mail nr 5
              post {
                always {
                 junit '**/TEST*.xml'
                 emailext attachLog: true, attachmentsPattern: '**/TEST*xml', body: '',
                  recipientProviders: [culprits()], subject:
                   '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!'
                   }
                    }
                     }
                      }
                       }