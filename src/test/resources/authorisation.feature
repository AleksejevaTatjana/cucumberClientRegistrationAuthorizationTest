Feature: A description

  Scenario: Happy path
    Given client
      | login | 123    |
      | pwd   | 111aaa |

    When we authorize client

    Then response is
      | result  | true |
      | details | none |


  Scenario Outline: Checking login authorization
    Given client
      | login | <login> |
      | pwd   | 111aaa  |

    When we authorize client

    Then response is
      | result  | <result>  |
      | details | <details> |

    Examples:
      | login | result | details                |
      | 123   | true   | none                   |
      |       | false  | Field login missed     |
      | 012   | false  | Field login bad format |
      | -123  | false  | Field login bad format |
      | 1,23  | false  | Field login bad format |
      | 1ab   | false  | Field login bad format |


  Scenario Outline: Checking password authorization
    Given client
      | login | 123   |
      | pwd   | <pwd> |

    When we authorize client

    Then response is
      | result  | <result>  |
      | details | <details> |

    Examples:
      | pwd    | result | details              |
      | 111aaa | true   | none                 |
      |        | false  | Field pwd missed     |
      | aaa    | false  | Field pwd bad format |
      | 012    | false  | Field pwd bad format |
      | -123   | false  | Field pwd bad format |
      | 1,23   | false  | Field pwd bad format |