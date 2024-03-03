class count {
    public static void main(String[] args) {
        // get initial time
        long init_time = System.currentTimeMillis();

        // count to 100000
        for(int i = 0; i < 100000; i++) { 
            System.out.println(i);
        }

        // get final time
        long final_time = System.currentTimeMillis();

        // print the duration
        System.out.println(String.format("It took %d milliseconds.", (final_time - init_time)));
    }
}