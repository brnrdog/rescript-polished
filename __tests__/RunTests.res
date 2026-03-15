open Zekr

let allSuites = Array.concat(PolishedTest.suites, PolishedCssTest.suites)

runSuites(allSuites)
