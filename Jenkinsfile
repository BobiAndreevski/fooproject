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
          sh "mvn -B test"
           chuckNorris()
              }
       }
       stage('cobertura') {
                             steps {
                             sh "mvn clean install"
                                sh "mvn -B cobertura:cobertura"
                             }
                                post {
                                  always {
                                      junit '**/TEST*.xml'
                                     }
                                  }

       }

               stage('newman') {
                        steps {
                            sh 'newman run Restful_Booker.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
                        }

                        post {
                            always {

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
                 cobertura autoUpdateHealth: false,
                 autoUpdateStability: false,
                 coberturaReportFile: '**/coverage.xml',
                 conditionalCoverageTargets: '70, 0, 0',
                 enableNewApi: true, failUnhealthy: false,
                 failUnstable: false,
                 lineCoverageTargets: '80, 0, 0',
                 maxNumberOfBuilds: 0,
                 methodCoverageTargets: '80, 0, 0',
                 onlyStable: false, sourceEncoding: 'ASCII',
                 zoomCoverageChart: false

                 emailext attachLog: true,
                 attachmentsPattern: '**/TEST*xml',
                 body: '',
                 recipientProviders: [culprits()],
                 subject:'$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!'



                   }

                    }
                    }











