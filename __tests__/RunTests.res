open TestFramework

let allSuites = Array.concat(PolishedTest.suites, PolishedCssTest.suites)

runSuites(allSuites)
