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
              }
       }
       jacoco(
           execPattern: '/target/code-coverage/.exec',
           classPattern: '/target/classes',
           sourcePattern: '/src',
           inclusionPattern: 'com/company/**',
           changeBuildStatus: true,
           minimumInstructionCoverage: '70',
           maximumInstructionCoverage: '80'
       stage('Jacoco') {
            steps {
               sh './jenkins_build.sh'
               junit '*/build/test-results/*.xml'
              step([$class: 'JacocoPublisher',
                    execPattern: 'target/*.exec',
                    classPattern: 'target/classes',
                    sourcePattern: 'src/main/java',
                    exclusionPattern: 'src/test*'
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


