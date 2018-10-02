Feature: A description

  Scenario Outline: Checking login authorization
    Given client:
      | login | <login> |
      | pwd   | 111aaa  |

    When we authorize the client

    Then login response is:
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

  Scenario Outline: Checking password authorization
    Given client:
      | login | 123   |
      | pwd   | <pwd> |

    When we authorize the client

    Then password response is:
      | result  | <result>  |
      | details | <details> |

    Examples:
      | pwd    | result | details                |
      | 111aaa | true   | none                   |
      |        | false  | Field XXX missed       |
      | 012 | false  | Field login bad format |
      | -123   | false  | Field login bad format |
      | 1,23   | false  | Field login bad format |
      | 1ab    | false  | Field login bad format |

