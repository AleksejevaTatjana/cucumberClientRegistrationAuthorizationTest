Feature: A description

  Scenario Outline: Checking login authorization
    Given login authorization client:
      | login | <login> |
      | pwd   | 111aaa  |

    When we authorize login client:

    Then login authorization response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | login | result | details                |
      | 123   | true   | none                   |
      |       | false  | Field XXX missed       |
      | 012   | false  | Field login bad format |
      | -123  | false  | Field login bad format |
      | 1,23  | false  | Field login bad format |
      | 1ab   | false  | Field login bad format   |


  Scenario Outline: Checking password authorization
    Given password authorization client:
      | login | 123   |
      | pwd   | <pwd> |

    When we authorize the password client:

    Then password authorization response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | pwd    | result | details              |
      | 111aaa | true   | none                 |
      |        | false  | Field XXX missed     |
      | aaa    | false  | Field pwd bad format |
      | 012    | false  | Field pwd bad format |
      | -123   | false  | Field pwd bad format |
      | 1,23   | false  | Field pwd bad format |