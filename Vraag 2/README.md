# Test Score Calculator

This Delphi application calculates and displays test scores for two exams. It provides a user interface where you can enter the necessary information and view the results.

## Usage

To use this application, follow these steps:

1. Launch the application by executing the compiled executable file.
2. Enter the name of the person taking the test in the "Naam" (Name) input field.
3. Enter the relevant information in the "Van" (From) input field, if applicable.
4. Enter the test score for the first test in the "Punt1" input field.
5. Enter the test score for the second test in the "Punt2" input field.
6. Click the "Bereken" (Calculate) button to calculate the average score.
7. The results will be displayed in the "Afvoer" (Output) field, showing the test scores and the calculated average.

If you want to clear the input fields and start again, you can click the "Retry" button. To exit the application, click the "Close" button.

## Code Explanation

The code consists of a single form named `TForm1`. Here's a breakdown of the key components and their functionality:

### Form Components

- `edtNaam`: An edit box for entering the name of the person taking the test.
- `edtVan`: An edit box for entering additional information (e.g., origin).
- `edtPunt1`: An edit box for entering the score of the first test.
- `edtPunt2`: An edit box for entering the score of the second test.
- `lblNaam`: A label indicating the purpose of the `edtNaam` input field.
- `lblVan`: A label indicating the purpose of the `edtVan` input field.
- `btnBereken`: A button that triggers the calculation of the average score.
- `bmbRetry`: A bit button that clears the input fields for retrying.
- `bmbClose`: A bit button for closing the application.
- `redAfvoer`: A rich edit control for displaying the calculated results.

### Event Handlers

- `btnBerekenClick`: This event is triggered when the "Bereken" button is clicked. It retrieves the input values, performs the necessary calculations, and displays the results in the `redAfvoer` rich edit control.
- `bmbRetryClick`: This event is triggered when the "Retry" button is clicked. It clears all input fields to allow the user to start again.

## Conclusion

This readme provides an overview of the Delphi application that calculates test scores and explains how to use it. The application is designed to be user-friendly and allows for easy input of data and viewing of results. Feel free to explore the code and customize it according to your needs.
