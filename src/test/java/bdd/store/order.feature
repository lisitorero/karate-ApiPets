Feature: Administracion de las ordenes

  @order_01
  Scenario Outline: Consultar ordenes por id - <orderId>
    * def bodyUser = read('classpath:resources/json/getOrder.json')
    Given url urlBase
    And path "/store/order/<orderId>"
    And request bodyUser
    When method GET
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/getOrders.csv') |

  @order_02
  Scenario Outline: Eliminar ordenes por - <orderId>
    * def bodyUser = read('classpath:resources/json/getOrder.json')
    Given url urlBase
    And path "/store/order/<orderId>"
    And request bodyUser
    When method DELETE
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/deleteOrders.csv') |


  @order_03
  Scenario Outline: Unhappy Path - Eliminar orden con orderId no existente por - <orderId>
    * def bodyUser = read('classpath:resources/json/getOrder.json')
    Given url urlBase
    And path  "/store/order/<orderId>"
    And request bodyUser
    When method DELETE
    Then status 404
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | orderId |
      | 5       |




