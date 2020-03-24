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
        sh "mvn -B compile"
         }
           }
       stage('Test') {
        steps {
          sh"mvn -B test"
           chuckNorris()

            steps {

                        step([
                            $class           : 'JacocoPublisher',
                            execPattern      : 'build/jacoco/jacoco.exec',
                            classPattern     : 'build/classes/main',
                            sourcePattern    : 'src/main/java',
                            exclusionPattern : '**/*Test.class'
                        ])
                         publishHTML([
                                      allowMissing          : false,
                                      alwaysLinkToLastBuild : false,
                                      keepAll               : true,
                                      reportDir             : 'build/asciidoc/html5',
                                      reportFiles           : 'index.html',
                                      reportTitles          : "API Documentation",
                                      reportName            : "API Documentation"
                                  ])
        }
       }
         
               stage('newman') {
                        steps {
                            sh 'newman run Restful_Booker.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
                        }
                        post {
                            always {
                                    junit '**/*xml'
                                     chuckNorris()
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
                            chuckNorris()
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


                        }