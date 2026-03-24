import java.util.Scanner;

public class Methods
{
    //create method without returning any value (without object)
    public static void getRequirements()
    {
        //display operational messages
        System.out.println("Author: Jake H. Talsky");
        System.out.println("Program uses methods to: add, subtract, multiply, divide and power floating point numbers, rounded to two decimal places.");
        System.out.println("Note: Program checks for non-numeric values, and division by zero.");
        System.out.println(); //print blank line
    }

    public static void calculateNumbers()
    {
        //initialize variables and create Scanner object
        double num1 = 0.0, num2 = 0.0;
        char operation = ' '; //unlike empty string "must" include character--here, space character!
        //String operation = "";
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter mathematical operation (a=addition, s=subtraction, m=multiplication, d=division, e=exponentiation): ");
        //next() function returns next token
        //Token: smallest element of a program meaningful to compiler/interpreter
        //Generally, identifiers, keywords, literals, operators, and punctuations
        //Note: White space and comments not tokens--though, separate tokens
        //Example: "I like this" ("I" is 1st token, "like" is second token, and "this" is third token)

        //chain intrinsic (aka built-in) methods:
        //captures first character from user-entered token and converts to lower case
        operation = sc.next().toLowerCase().charAt(0);

        while (operation != 'a' && operation != 's' && operation != 'm' && operation != 'd' && operation != 'e')
        {
            System.out.print("\nIncorrect operation. Please enter correct operation: ");
            operation = sc.next().toLowerCase().charAt(0); //captures first character from first token
            //operation = sc.next();
        }

        System.out.print("Please enter first number: ");
        while (!sc.hasNextDouble())
        {
            System.out.println("Not valid number!\n");
            sc.next(); //Important! If omitted, will go into infinite loop on invalid input!
            System.out.print("Please try again. Enter first number: ");
        }
        num1 = sc.nextDouble();

        System.out.print("Please enter second number: ");
        while (!sc.hasNextDouble())
        {
            System.out.println("Not valid number!\n");
            sc.next(); //Important! If omitted, will go into infinite loop on invalid input!
            System.out.print("Please try again. Enter second number: ");
        }
        num2 = sc.nextDouble();

        //test operation
        if (operation == 'a')
        {
            addition(num1, num2);
        }
        else if (operation == 's')
        {
            subtraction(num1, num2);
        }
        else if (operation == 'm')
        {
            multiplication(num1, num2);
        }
        else if (operation == 'd')
        {
            if (num2 == 0)
            {
                System.out.println("Cannot divide by zero!");
            }
            else
            {
                division(num1, num2);
            }
        }
        else if (operation == 'e')
        {
            exponentiation(num1, num2);
        }

        System.out.println(); // print blank line

        sc.close(); //close scanner
    }

    //create mathematical methods
    public static void addition(double n1, double n2)
    {
        System.out.print(n1 + " + " + n2 + " = ");
        System.out.printf("%.2f", (n1 + n2));
    }

    public static void subtraction(double n1, double n2)
    {
        System.out.print(n1 + " - " + n2 + " = ");
        System.out.printf("%.2f", (n1 - n2));
    }

    public static void multiplication(double n1, double n2)
    {
        System.out.print(n1 + " * " + n2 + " = ");
        System.out.printf("%.2f", (n1 * n2));
    }

    public static void division(double n1, double n2)
    {
        System.out.print(n1 + " / " + n2 + " = ");
        System.out.printf("%.2f", (n1 / n2));
    }

    public static void exponentiation(double n1, double n2)
    {
        System.out.print(n1 + " to the power of " + n2 + " = ");
        System.out.printf("%.2f", (Math.pow(n1, n2)));
    }
}