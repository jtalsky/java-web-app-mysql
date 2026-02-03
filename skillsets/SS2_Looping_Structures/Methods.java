public class Methods
{
    public static void getRequirements()
    {
        System.out.println("Developer: Jake H. Talsky");
        System.out.println("Program loops through array of floats.");
        System.out.println("Use following values: 1.0, 2.1, 3.2, 4.3, 5.4.");
        System.out.println("Use following loop structures: for, enhanced for, while, do...while.");
        System.out.println("\nNote: Pretest loops: for, enhanced for, while. Posttest loop: do...while.");
        System.out.println();
    }

    public static void arrayLoops()
    {
        float[] myFloats = {1.0f, 2.1f, 3.2f, 4.3f, 5.4f};

        System.out.println("for loop:");
        for(int i = 0; i < myFloats.length; i++)
        {
            System.out.println(myFloats[i]);
        }

        System.out.println("\nenhanced for loop:");
        for(float test : myFloats)
        {
            System.out.println(test);
        }

        System.out.println("\nwhile loop:");
        int i = 0;
        while(i < myFloats.length)
        {
            System.out.println(myFloats[i]);
            i++;
        }

        System.out.println("\ndo...while loop:");
        i = 0; //reassign 0 to test variable
        do
        {
            System.out.println(myFloats[i]);
            i++;
        }
        while(i < myFloats.length);
    }
}