Feature: Testing registration API

  Scenario Outline: Checking login validation
    Given client:
      | login       | <login>                                                                                                                    |
      | email       | a@b.com                                                                                                                    |
      | phone       | +371 6111111                                                                                                               |
      | pwd         | 111aaa                                                                                                                     |
      | birthDate   | 21                                                                                                                         |
      | description | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua |

    Given address is:
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register the client

    Then response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | login | result | details                |
      | 123   | true   | none                   |
      |       | false  | Field XXX missed       |
      | 012   | false  | Field login bad format |
      | -123  | false  | Field login bad format |
      | 1,23  | false  | Field login bad format |
      | 1ab   | false  | Field login bad format |

    Then we register client one more time

    And response is:
      | 123 | false | Field YYY already exists |


  Scenario Outline: Checking password validation
    Given client:
      | login       | 123              |
      | email       | hm@pt.com        |
      | phone       | +371 6111111     |
      | pwd         | <password>       |
      | birthDate   | 60               |
      | description | Some description |

    Given address is:
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register the client

    Then response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | password | result | details              |
      | 111aaa   | true   | none                 |
      |          | false  | Field XXX missed     |
      | 45ффф    | false  | Field pwd bad format |
      | 45       | false  | Field pwd bad format |
      | aaa      | false  | Field pwd bad format |
      | -1+_a=   | false  | Field pwd bad format |


  Scenario Outline: Checking age validation
    Given client:
      | login       | 563                   |
      | email       | tt@nm.com             |
      | phone       | +371 6111111          |
      | pwd         | sfdfsd235345          |
      | birthDate   | <birthDate>           |
      | description | Some test description |

    And client address is:
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register user

    Then response is:
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
    Given client:
      | login       | 429           |
      | email       | kk@aa.com     |
      | phone       | +371 6111111  |
      | pwd         | jj3           |
      | birthDate   | 42            |
      | description | <description> |

    And client address is:
      | country | US        |
      | city    | New York  |
      | state   | John Doe  |
      | zip     | LV-1011   |
      | street  | Ropazu 10 |

    When we register user

    Then response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | description                                                                                                                | result | details                      |
      | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua | true   | none                         |
      | text 1                                                                                                                     | false  | Field description bad format |
      |                                                                                                                            | false  | Field XXX missed             |
      | 8888text                                                                                                                   | false  | Field descriprion bad format |
      | 0                                                                                                                          | false  | Field descriprion bad format |
      | Lorem ipsum dolor sit amet, consectetur adipiscing elit                                                                    | false  | Field description bad format |
      | text -0123445;                                                                                                             | false  | Field descriprion bad format |
      | паьтапикхж                                                                                                                 | false  | Field descriprion bad format |