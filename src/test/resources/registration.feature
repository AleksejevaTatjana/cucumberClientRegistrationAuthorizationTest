Feature: Testing registration API

  Scenario Outline: Checking login validation
    Given login client:
      | login       | <login>                                                                                                                    |
      | email       | a@b.com                                                                                                                    |
      | phone       | +371 6111111                                                                                                               |
      | pwd         | 111aaa                                                                                                                     |
      | birthDate   | 21                                                                                                                         |
      | description | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua |

    Given login address is:
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register login client:
    And we register login client again:

    Then login response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | login | result | details                  |
      | 123   | true   | none                     |
      |       | false  | Field XXX missed         |
      | -123  | false  | Field login bad format   |
      | 1,23  | false  | Field login bad format   |
      | 123   | false  | Field YYY already exists |


  Scenario Outline: Checking password validation
    Given password client:
      | login       | 123              |
      | email       | hm@pt.com        |
      | phone       | +371 6111111     |
      | pwd         | <password>       |
      | birthDate   | 60               |
      | description | Some description |

    Given password address is:
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register the client with password

    Then pwd response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | password | result | details              |
      | 111aaa   | true   | none                 |
      |          | false  | Field XXX missed     |
      | 45       | false  | Field pwd bad format |
      | aaa      | false  | Field pwd bad format |
      | -123     | false  | Field pwd bad format |
      | 1,23     | false  | Field pwd bad format |


  Scenario Outline: Checking age validation
    Given age client:
      | login       | 563                   |
      | email       | tt@nm.com             |
      | phone       | +371 6111111          |
      | pwd         | sfdfsd235345          |
      | birthDate   | <birthDate>           |
      | description | Some test description |

    Given age client address is:
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register age client

    Then age response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | birthDate      | result | details                   |
      | 21             | true   | none                      |
      | 22             | true   | none                      |
      | 50             | true   | none                      |
      |                | false  | Field XXX missed          |
      | 20             | false  | Field birthday bad format |
      | 0              | false  | Field birthday bad format |
      | -1             | false  | Field birthday bad format |
      | 0,21           | false  | Field birthday bad format |
      | 20 with a half | false  | Field birthday bad format |


  Scenario Outline: Checking description validation
    Given description client:
      | login       | 429           |
      | email       | kk@aa.com     |
      | phone       | +371 6111111  |
      | pwd         | jj3           |
      | birthDate   | 42            |
      | description | <description> |

    And description client address is:
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register description client:

    Then description response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | description                                                                                                                 | result | details                      |
      | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua  | true   | none                         |
      |                                                                                                                             | false  | Field XXX missed             |
      | Lorem ipsum dolor sit amet, consectetur adipiscing elit vkwemvlk vkemwmvkm kvmkmlkem memvkedm velewe kvmevlk ekv klfvldkvls | false  | Field description bad format |
      | 1234567899876543210                                                                                                         | false  | Field description bad format |
