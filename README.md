# GoTemplate
A template for a good start into new Go projects.

## Things to do after cloning:
<details>
  <summary><b>Linux/MacOS</b></summary>

  1. Give rights to execute sh files.
  ```
  chmod +x initialize.sh build.sh
  ```
  2. Prepare the project. Ensure the files located in right directory (Project name)
  3. Initialize the project
  The initialize.sh has a parameter "-dg" for delete git. Use this parameter to disconnect from GoTemplates git. You want you own for sure.
  ```
  ./initialize.sh -dg
  ```
  4. Build project for test purposes
  ```
  ./build.sh
  ```
</details>

<details>
  <summary><b>Windows</b></summary>

  1. Prepare the project. Ensure the files located in right directory (Project name)
  2. Initialize the project
  The initialize.sh has a parameter "-dg" for delete git. Use this parameter to disconnect from GoTemplates git. You want you own for sure.
  ```
  initialize.bat -dg
  ```
  3. Build project for test purposes
  ```
  build.bat
  ```
</details>
