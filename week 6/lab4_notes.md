Achine Bryan Berinyuy
VUG/SEN/24/12219
Lab 4 Notes

In Part 4, deleting the newly created "Library and Information Science" department
produced **Error 1451: Cannot delete or update a parent row: a foreign key constraint
fails**. MySQL refused the delete because the `department` table is the parent in a
foreign-key relationship: `student.dept_id` references `department.dept_id`, and the
"Transfer Student" row (`20239999`) still pointed at that department. Referential
integrity therefore stops the parent row being removed while a child row still
depends on it, which prevents orphaned records that would point at a department
that no longer exists.

I fixed it by dealing with the child first: I updated the dependent student's
`dept_id` to the Software Engineering department, then re-ran the `DELETE`, which
succeeded and left the student safely reassigned rather than lost. An alternative
fix would have been to define the foreign key with `ON DELETE SET NULL`, so MySQL
clears the student's `dept_id` automatically when the department is deleted; that
preserves the student record without requiring a manual `UPDATE` first. `ON DELETE
CASCADE` would also avoid the error, but it would silently delete the student along
with the department, which is usually the wrong business rule, and temporarily
disabling `FOREIGN_KEY_CHECKS` would bypass the constraint but leave an orphaned
child row, so neither is a genuine fix.