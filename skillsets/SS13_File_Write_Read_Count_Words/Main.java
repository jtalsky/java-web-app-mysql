// Javadoc: documentation generator for generating
// API documentation in HTML format from Java source code.
// https://www.oracle.com/technical-resources/articles/java/javadoc-tool.html

import java.io.File; //provides input/output streams used to write/read data to input/output sources

class Main
{
    public static void main(String[] args)
    {
        //call static void methods (i.e., no object, non-value returning)
        Methods.getRequirements();

        //returns file object (*IF* writeable!)
        File myFile = Methods.fileWrite();
        if (myFile != null)
        {
            System.out.println("\nFile written to: " + myFile.getAbsolutePath());
        }

        Methods.fileRead(myFile);
    }
}