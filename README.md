Slides for talks - Bérénice Batut
=================================

This repository served the slides for my talks.

# Usage

## Install the requirements

1. Open a Terminal
2. (If not done yet) Clone the training material GitHub repository: 

    ```
    $ git clone https://github.com/bebatut/2021.git
    ```

3. Navigate to the `2021/` folder with `cd`
4. Set up the conda environment:

    ```
    $ make create-env
    ```

4. Install Jekyll, Decktape and related modules into the conda environment: 

    ```
    $ make install
    ```

## Generate the site locally

1. Run a local Jekyll server:

    ```
    $ make serve
    ```

2. Visualize at `http://localhost:4000/2021/`

## Generate PDF of the slides

1. Install [Decktape](https://github.com/astefanutti/decktape)

    ```
    $ npm install decktape
    ```

2. Run Decktape

    ```
    $ `npm bin`/decktape reveal --size 2048x1536 URL_TO_SLIDES PATH_TO_PDF
    ```
