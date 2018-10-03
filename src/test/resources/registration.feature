Feature: Testing registration API

  Scenario: Happy path
    Given client
      | email       | random                                                                                                                     |
      | phone       | +371 6111111                                                                                                               |
      | pwd         | 111aaa                                                                                                                     |
      | birthDate   | 1988-06-25T00:00:00.000Z                                                                                                   |
      | description | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua |

    And address is
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register client

    Then response is
      | result  | true |
      | details | none |


  Scenario: Email already exists
    Given client
      | email       | random                                                                                                                     |
      | phone       | +371 6111111                                                                                                               |
      | pwd         | 111aaa                                                                                                                     |
      | birthDate   | 1988-06-25T00:00:00.000Z                                                                                                   |
      | description | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua |

    And address is
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register client
    And we register client

    Then response is
      | result  | false                      |
      | details | Field email already exists |


  Scenario Outline: Checking password validation
    Given client
      | email       | random                                                                                                                     |
      | phone       | +371 6111111                                                                                                               |
      | pwd         | <password>                                                                                                                 |
      | birthDate   | 1988-06-25T00:00:00.000Z                                                                                                   |
      | description | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua |

    And address is
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register client

    Then response is
      | result  | <result>  |
      | details | <details> |

    Examples:
      | password | result | details              |
      | 111aaa   | true   | none                 |
      |          | false  | Field pwd missed     |
      | 45       | false  | Field pwd bad format |
      | aaa      | false  | Field pwd bad format |
      | -123     | false  | Field pwd bad format |
      | 1,23     | false  | Field pwd bad format |


  Scenario Outline: Checking birthDate validation
    Given client
      | email       | random                                                                                                                     |
      | phone       | +371 6111111                                                                                                               |
      | pwd         | 111aaa                                                                                                                     |
      | birthDate   | <birthDate>                                                                                                                |
      | description | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua |

    And address is
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register client

    Then response is
      | result  | <result>  |
      | details | <details> |

    Examples:
      | birthDate                   | result | details                   |
      | 1988-06-25T00:00:00.000Z    | true   | none                      |
      | 1990-06-25T00:00:00.000Z    | true   | none                      |
      | 2005-06-25T00:00:00.000Z    | false  | Field birthday bad format |
      | 06-01-2002                  | false  | Field birthday bad format |
      |                             | false  | Field birthday missed     |
      | 50                          | false  | Field birthday bad format |
      | 0                           | false  | Field birthday bad format |
      | 1988-06-25                  | false  | Field birthday bad format |
      | 1988.06.25                  | false  | Field birthday bad format |
      | 12th of September 1964 year | false  | Field birthday bad format |
      | 25.06.1988                  | false  | Field birthday bad format |
      | 25.06.88                    | false  | Field birthday bad format |
      | -1                          | false  | Field birthday bad format |
      | 0,21                        | false  | Field birthday bad format |
      | 20 with a half              | false  | Field birthday bad format |


  Scenario Outline: Checking description validation
    Given client
      | email       | random                   |
      | phone       | +371 6111111             |
      | pwd         | 111aaa                   |
      | birthDate   | 1988-06-25T00:00:00.000Z |
      | description | <description>            |

    And address is
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register client

    Then response is
      | result  | <result>  |
      | details | <details> |

    Examples:
      | description                                                                                                                 | result | details                      |
      | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua  | true   | none                         |
      |                                                                                                                             | false  | Field description missed     |
      | Lorem ipsum dolor sit amet, consectetur adipiscing elit vkwemvlk vkemwmvkm kvmkmlkem memvkedm velewe kvmevlk ekv klfvldkvls | false  | Field description bad format |
      | 1234567899876543210                                                                                                         | false  | Field description bad format |
