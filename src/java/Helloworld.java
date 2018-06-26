/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ISI7
 */
import java.util.Comparator;
import java.util.Map;
import java.util.TreeMap;

/**
 * @author Rais.Alam
 * @date Dec 12, 2012
 */
public class Helloworld
{
    public static void main(String[] args)
    {
        final boolean order = true;
        try
        {

            Map<Integer, String> map = new TreeMap<Integer, String>(
                    new Comparator<Integer>()
                    {

                        @Override
                        public int compare(Integer first, Integer second)
                        {

                            if (order)
                            {

                                return second.compareTo(first);
                            }
                            else
                            {
                                return first.compareTo(second);

                            }
                        }
                    });

            map.put(2, "v");
            map.put(3, "h");
            map.put(4, "e");
            map.put(1, "a");

            System.out.println(map);

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}