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
       }
         stage('Build') {
            steps {
              sh './jenkins_build.sh'
                junit '*/build/test-results/*.xml'
                   step( [ $class: 'JacocoPublisher' ] )
                   }
                        }
               stage('newman') {
                        steps {
                            sh 'newman run Restful_Booker.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
                        }
                        post {
                            always {
                                    junit '**/*xml'
                                }
                            }
                    }
stage('robot') {
            steps {
                sh 'robot -d results --variable BROWSER:headlesschrome infotiv_car_rental.robot'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                           )
                    }
                }
            }
        }



                }
            // Testar att skicka mail nr 8
              post {
                always {
                 junit '**/TEST*.xml'
                 emailext attachLog: true, attachmentsPattern: '**/TEST*xml', body: '',
                  recipientProviders: [culprits()], subject:
                   '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!'
                   }
                    }
                     }


