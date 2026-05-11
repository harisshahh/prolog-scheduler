# May 10 3:05 PM
Thoughts so far:
I have to build a work scheduler in Prolog that assigns some employees to workstations and shifts, while still making sure that I am within the constraints of the project. For the past few days I have been thinking about how I will be able to represent these assignments internally. I just got the project structure laid out and I think the recursion and backtracking aspect of Prolog might be the biggest challenge I face when building this out.

# May 10 5:10 PM
I have already started setting up the basic structure of the scheduler, with defining the three shifts and making helper predicates to work with the employee list from the facts file.. I also added some predicates for workstation_idle, avoid_shift, and avoid_workstation so that the program won't crash when some facts are missing. Another thing I have started writing is a can_work predicate which checks whether an employee is able to work at a given workstation given a shift. It checks the validity of the shift, the existence of the workstation, and then applies these for avoiding either of them. Also, one thing that I have noticed with writing in Prolog is how different it is from what I am used to coding with because there are no loops, just recursion and backtracking.

# May 10 8:00 PM
So now that the basic constraint checking with the can_work predicate got set up, I now had to start actually generating the assignments for each employee. This part did feel a little bit more complex because instead of just checking conditions, I now need Prolog to choose the valid combinations of shifts and workstations. Through a recursive generate_assignments predicate I implemented, it takes a list of employees and assigns each of them a valid shift and workstaion pair using backtracking from the can_work predicate. 

# May 10 9:00 PM
I now focused on counting how many employees are assigned to a workstation during a shift and then checking these counts with the maximum and minimum workstation constraints. The recursive logic took some time for me because I had to think through separating the assignment cases in where there is either a match or none. Now this scheduler is feeling more complete because of the fact that it can now generate the assignments and reject the invalid staffing arrangements.

# May 10 10:24 PM
In this period of time I have mainly focused on converting the raw assignments data into the actual final plan formatting or structure required for the project. I used predicates to collect all employees assigned to a workstation at a given shift using findall and then I grouped these assignments of the workstations into shift schedules. Now the scheduler is looking like how it is supposed to.

# May 10 11:15 PM
This final session mostly was focused on integrating all of the previous predicates together into the complete work scheduler. I added the final plan predicate which compiles all together the employee assignments generation, the workstation staffing validity, and the shift scheduler into the required output. After integrating, I spend some time with the test files and making sure that the invalid schedules fail as they are supposed to. I also added a README with instructions for loading and running the scheduler in SWI-Prolog.