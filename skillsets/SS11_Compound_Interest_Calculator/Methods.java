//https://www.calculatorsoup.com/calculators/financial/compound-interest-calculator.php
//Note: review "Calculation Steps" on left side of URL above!
//https://www.investopedia.com/terms/c/compoundinterest.asp
//check for numeric input: https://www.tutorialspoint.com/java/util/scanner_hasnextdouble.htm

import java.text.NumberFormat;
import java.util.Locale;
import java.util.Scanner;

public class Methods
{
    public static void getRequirements()
    {
        //display operational messages
        System.out.println("Author: Jake H. Talsky");
        System.out.println("Program Requirements:");
        System.out.println("1. Calculates amount of money saved for a period of years, at a *monthly* compounded interest rate.");
        System.out.println("2. Returned amount is formatted in U.S. currency, and rounded to two decimal places.");
        System.out.println("3. Must perform data validation: for non-numeric values, as well as only integer values for years.");

        System.out.println(); //print blank line
    }

    //nonvalue-returning method (static requires no object)
    public static void getInterestValues()
    {
        //initialize variables
        Scanner sc = new Scanner(System.in);
        double principal = 0.0; //initial amount
        double rate = 0.0;      //percentage rate
        int time = 0;           //years

        //prompt user
        //hasNextDouble(): returns true if next token in scanner's input can be interpreted as double value
        System.out.print("Current principal: $");
        while (!sc.hasNextDouble())
        {
            System.out.println("Not valid number!\n");
            sc.next(); //Important! If omitted, will go into infinite loop on invalid input!
            System.out.print("Please try again. Enter principal: $");
        }
        principal = sc.nextDouble();

        System.out.print("Interest Rate (per year): ");
        while (!sc.hasNextDouble())
        {
            System.out.println("Not valid number!\n");
            sc.next(); //Important! If omitted, will go into infinite loop on invalid input!
            System.out.print("Please try again. Enter interest rate: ");
        }
        rate = sc.nextDouble();
        rate = rate / 100;

        System.out.print("Total time (in years): ");
        while (!sc.hasNextInt())
        {
            System.out.println("Not valid integer!\n");
            sc.next(); //Important! If omitted, will go into infinite loop on invalid input!
            System.out.print("Please try again. Enter years: ");
        }
        time = sc.nextInt();

        sc.close(); //close scanner

        //method call
        calculateInterest(principal, rate, time);
    }

    //nonvalue-returning method (static requires no object)
    public static void calculateInterest(double p, double r, int t)
    {
        //initialize variables
        int n = 12;          //number of times per year interest compounded (monthly)
        double i = 0.0;      //interest
        double a = 0.0;      //amount

        a = p * Math.pow(1 + (r / n), n * t);
        i = a - p;

        r = r * 100; //convert back to percentage value user entered

        //US currency
        NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.US);
        System.out.println("\nInitial principal: " + nf.format(p));
        //System.out.println("Annual interest rate: " + r + "%");
        //or...using printf()
        System.out.printf("Annual interest rate: %.1f%%%n", r);
        System.out.println("Total monthly compounded interest after " + t + " years: " + nf.format(i));
        System.out.println("Total amount: " + nf.format(a));
    }
}