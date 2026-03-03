import java.util.Scanner;

public class Methods
{
    //Create Method without returning any value (without object)
    public static void getRequirements()
    {
        //display operational messages
        System.out.println("Developer: Jake H. Talsky");
        System.out.println("Program Requirements:");
        System.out.println("\t1. Write an application that displays integer equivalents of uppercase letters.");
        System.out.println("\t2. Display the character equivalents of ASCII values 48 - 122.");
        System.out.println("\t3. Display the character equivalents of ASCII value user input.");

        System.out.println("\tNote: Compare answers to http://www.asciitable.com/");
        System.out.println(); //prints blank line
    }

    public static void getAscii()
    {
        // initialize variables
        int num = 0;
        boolean isValidNum = false;
        Scanner sc = new Scanner(System.in);

        System.out.println("Printing characters A-Z as ASCII values:");
        for (char character = 'A'; character <= 'Z'; character++)
        {
            System.out.printf("Character %c has ascii value %d\n", character, ((int) character));
        }

        // Or, typecasting:
        System.out.println("\nPrinting ASCII values 48-122 as characters:");
        for (num = 48; num <= 122; num++)
        {
            System.out.printf("ASCII value %d has character value %c\n", num, ((char) num));
        }

        // allow user input
        System.out.println("\nAllowing user ASCII value input:");

        while (isValidNum == false)
            {
            // check num double
            System.out.print("Please enter ASCII value (32 - 127): ");
            if (sc.hasNextInt())
            {
                num = sc.nextInt();
                isValidNum = true;
            }
            else
            {
                System.out.println("Invalid integer--ASCII value must be a number.\n");
            }
            sc.nextLine(); // discard any other data entered on line

            // num data true, check num range
            if (isValidNum == true && num < 32 || num > 127)
            {
                System.out.println("ASCII value must be >= 32 and <= 127.\n");
                isValidNum = false;
            }

            if (isValidNum == true)
            {
                System.out.println();

                // display result
                System.out.printf("ASCII value %d has character value %c\n", num, ((char) num));
            }
        }

        sc.close(); // close scanner
    }
}