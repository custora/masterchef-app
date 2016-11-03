# The MasterChef App

This is the app deployed in the
[Masterchef](https://github.com/custora/masterchef) exercise. Please see that
README for context.

Some info about this app:

 * It connects to MySQL, using credentials that need to be set in
   `config/database.yml` on the frontend & backend hosts.

 * The landing page (on `/`) checks if it can reach the database and run a
   job. If so it renders the string `success`, otherwise a rudimentary error.

 * The app uses the `delayed_job` backend to `ActiveJob`, which maintains the
   job queue in a MySQL table. Note that if jobs are queued while the worker is
   not running they will be dropped on the floor, which is fine for this
   exercise.
