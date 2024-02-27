package by.belstu.it.kozeka.basejava;
import java.util.Arrays;
import static java.lang.Math.*;
/*
    @author jokimi (Kozeka Elizaveta)
    @version 1.0
*/
public class JavaTest {
    /*
        * @return void
        * @throws java.Exception
        * @param String[] args
    */
    public static void main(String[] args) {
        /*
            * @value 'q'
            * @see line 30
        */
        char ch = 'q';
        int i_num = 123;
        short sh_num = 5;
        byte b_num = 127;
        long l_num = 98L;
        boolean bool = true;
        String str = "string";
        double d_num = 15.69;

        var str_int = str + i_num;
        System.out.println(str_int);
        var str_char = str + ch;
        System.out.println(str_char);
        var str_double = str + d_num;
        System.out.println(str_double);
        byte byte_int = (byte)(b_num + i_num);
        System.out.println(byte_int);
        int double_long = (int)(d_num + l_num);
        System.out.println(double_long);
        long int_plus = i_num + 2147483647;
        System.out.println(-int_plus);
        wsint();
        boolean b_and_b = bool && bool;
        System.out.println(b_and_b);
        boolean b_xor_b = bool ^ bool;
        System.out.println(b_xor_b);
        //boolean bb = bool + bool;

        long var1 = 9223372036854775807L;
        long var2 = 0x7fff_ffff_fffL;
        char ch1 = 'a';
        char ch2 = '\u0061';
        char ch3 = 97;
        System.out.println(ch1 + ch2 + ch3);

        System.out.println(3.45 % 2.4);
        System.out.println(1.0 / 0.0);
        System.out.println(0.0 / 0.0);
        System.out.println(log(-345));
        System.out.println(Float.intBitsToFloat(0x7F800000));
        System.out.println(Float.intBitsToFloat(0xFF800000));
        System.out.println("pi = " + PI + "; e = " + E);
        System.out.println("pi = " + round(PI) + "; e = " + round(E));
        System.out.println(min(PI, E));
        System.out.println(random());

        Boolean bool_obj = Boolean.TRUE;
        Character char_obj = 'o';
        Integer i_obj = 78;
        Byte b_obj = 12;
        Short sh_obj = 6;
        Long l_obj = 56L;
        Double d_obj = 7.5;

        System.out.println(b_obj >> 1);
        System.out.println(b_obj >>> 1);
        System.out.println(b_obj & sh_obj);
        System.out.println(b_obj | sh_obj);
        System.out.println(i_obj / b_obj);
        System.out.println(~l_obj);
        System.out.println(i_obj + l_obj);
        System.out.println("Long: max = " + Long.MAX_VALUE + "; min = " + Long.MIN_VALUE);
        System.out.println("Double: max = " + Double.MAX_VALUE + "; min = " + Double.MIN_VALUE);

        /* Упаковка */
        Integer int_in = 9;
        Byte byte_in = 2;
        /* Распаковка */
        int int_out = int_in;
        System.out.println(int_out);
        byte byte_out = byte_in;
        System.out.println(byte_out);

        System.out.println(Integer.parseInt("41"));
        System.out.println(Integer.toHexString(1456));
        System.out.println(Integer.compare(124, 78));
        String str1 = Integer.toString(-347);
        System.out.println(str1);
        System.out.println(Integer.bitCount(7));

        String s34 = "2345";
        System.out.println(Integer.valueOf(s34));
        System.out.println(Integer.parseInt(s34));
        byte[] bytes = s34.getBytes();
        System.out.println(Arrays.toString(bytes));
        String s34_new = new String(bytes);
        System.out.println(s34_new);
        boolean bool34_1 = Boolean.valueOf(s34);
        boolean bool34_2 = Boolean.parseBoolean(s34);
        System.out.println("bool34_1 = " + bool34_1 + "; bool34_2 = " + bool34_2);

        String str_1 = "1369";
        String str_2 = "1369";
        System.out.println(str_1 == str_2);
        System.out.println(str_1.equals(str_2));
        System.out.println(str_1.compareTo(str_2));

        str_2 = null;
        System.out.println(str_1 == str_2);
        System.out.println(str_1.equals(str_2));
        //System.out.println(str_1.compareTo(str_2));
        /* нельзя с null */

        str_1 = "I am fine";
        String[] words = str_1.split(" ");
        for (String word : words) {
            System.out.println(word);
        }
        System.out.println(str_1.contains(" am"));
        System.out.println(str_1.hashCode());
        System.out.println(str_1.indexOf("fine"));
        System.out.println(str_1.length());

        char[][] c1;
        char[] c2[] = {{'c', '1'},{'2','A'}};
        char c3[][]= {{'C', '1', '3'},{'o', 'k'},{'l', 'a'}};
        c1 = new char[3][];
        c1[0] = new char[3];
        c1[1] = new char[4];
        c1[2] = new char[5];
        System.out.println(c1.length);
        System.out.println(c1[0].length);
        System.out.println(c1[1].length);
        System.out.println(c1[2].length);
        System.out.println("c2 == c3: " + (c2 == c3));
        c2 = c3;
        for(char[] arr : c2) {
            for(char chh : arr) {
                System.out.println(chh);
            }
        }

        WrapperString w_str = new WrapperString();
        w_str.setString("Wrapper String");
        w_str.replace('W','X');
        System.out.println(w_str.getString());
        WrapperString w_anonim = new WrapperString(){
            @Override
            public void replace(char old_char, char new_char)
            {
                super.replace(old_char, new_char);
                System.out.println("Replace from anonim");
            }
            public void delete(char new_char)
            {
                super.replace(new_char, ' ');
                System.out.println("Delete from anonim");
            }
        };
    }
    static int s_int;
    public static void wsint() {
        System.out.println(s_int);
    }
    public final int f_int2 = 5;
    public static final int f_int3 = 6;
}