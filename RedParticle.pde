class RedParticle extends Virus {

    int x, y, radius;
    boolean infected = true;
    int initDirection;
    int bX1, bX2, bY1, bY2;

    RedParticle(int pX, int pY, int pRadius) {
        super(pX, pY, pRadius);
        x = pX;
        y = pY;
        radius = pRadius;
        randomizeMove();
    }

    void setBoundary(int x1, int x2, int y1, int y2){
        bX1 = x1;
        bX2 = x2;
        bY1 = y1;
        bY2 = y2;
    }

    void randomizeMove(){
        initDirection = int(random(0, 8));
    }

    void move() {
        switch(initDirection) {
            case 0:
                super.forward();
                break;
            case 1:
                super.backward();
                break;
            case 2:
                super.ascend();
                break;
            case 3:
                super.descend();
                break;
            case 4:
                super.toTopRight();
                break;
            case 5:
                super.toBottomRight();
                break;
            case 6:
                super.toTopLeft();
                break;
            case 7:
                super.toBottomLeft();
                break;
        }
    }




}