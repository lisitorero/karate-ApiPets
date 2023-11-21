Feature: Añadir pet al store

  @pet_04
  Scenario Outline: Unhappy path - Eliminar pet con <id> invalido
    Given url urlBase
    And path  "/pet/<petId>"
    When method DELETE
    Then status 404
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/deletePets.csv') |

