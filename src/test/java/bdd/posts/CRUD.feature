Feature: Mi primer CRUD con Karate

  @ObtenerUsuario
  Scenario: Obtener usuario
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then status 200
    * def first_name = response.data.first_name
    * match first_name == "Janet"

  @CrearUsuario
  Scenario: Crear usuario
    Given url 'https://reqres.in/api/users'
    When request
    """
    {
    "name": "morpheus",
    "job": "leader"
    }
    """
    And method post
    Then status 201

   @ActualizarUsuario
   Scenario: Actualizar usuario
     Given url 'https://reqres.in/api/users/2'
     When request
     """
     {
    "name": "morpheus",
    "job": "zion resident"
     }
     """
     And method put
     Then status 200

   @EliminarUsuario
   Scenario: Elinimar usuario
     Given url 'https://reqres.in/api/users/2'
     When method delete
     Then status 204