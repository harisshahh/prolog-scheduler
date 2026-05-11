shift(morning).
shift(evening).
shift(night).

workstation_idle(_, _) :- fail. % the fallbacks to make sure no runtime errors
avoid_shift(_, _) :- fail.
avoid_workstation(_, _) :- fail.


all_employees(Employees) :- 
    findall(E, employee(E), Employees).

can_work(Employee, Shift, Workstation) :-
    shift(Shift),
    workstation(Workstation, _, _),
    \+ avoid_shift(Employee, Shift),
    \+ avoid_workstation(Employee, Workstation),
    \+ workstation_idle(Workstation, Shift).

generate_assignments([], []).

generate_assignments([Employee | RestOfEmployees], 
[assign(Employee, Shift, Workstation) | RestOfAssignments]) :-
    shift(Shift),
    workstation(Workstation, _, _),

    can_work(Employee, Shift, Workstation),
    generate_assignments(RestOfEmployees, RestOfAssignments).