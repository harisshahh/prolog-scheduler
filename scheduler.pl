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

count_workers(_, _, [], 0).

count_workers(Shift, Workstation,
    [assign(_, Shift, Workstation) | Rest],
    Count) :-
    count_workers(Shift, Workstation, Rest, RestCount),
    Count is RestCount + 1.
count_workers(Shift, Workstation,
    [assign(_, OtherShift, OtherWorkstation) | Rest],
    Count) :-
    (
        Shift \= OtherShift
        ;
        Workstation \= OtherWorkstation
    ),

    count_workers(Shift, Workstation, Rest, Count).

valid_workstation_counts(Assignments) :- % to validate the workstation counts
    forall(
        (
            workstation(Workstation, Min, Max),
            shift(Shift),
            \+ workstation_idle(Workstation, Shift)
        ),
        (
            count_workers(
                Shift,
                Workstation,
                Assignments,
                Count
            ),
            Count >= Min,
            Count =< Max
        )
    ).