class WhiteParticle extends Virus {

    //int x, y, radius;
    boolean infected;
    int initDirection;
    int bX1, bX2, bY1, bY2;
    int infectionCount;
    int INFECTION_MAX = 2;

    WhiteParticle(int pX, int pY, int pRadius, boolean pInfected) {
        super(pX, pY, pRadius);
        infectionCount = 0;
        infected = pInfected;
        if(infected){
          super.setColor(color(227, 85, 57)); // make red
        } else {
          super.setColor(color(255)); // make this cell white
        }
        randomizeMove();
    }

    void infect(WhiteParticle w) {
      
      float distance = dist(super.x, super.y, w.x, w.y);
      if (distance < super.radius + w.radius) {
          w.infected = true;
          infectionCount++;
          w.setColor(color(227, 85, 57));
      }
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

    boolean isWithinX() {
        return super.x >= bX1 && super.x <= bX2;
    }

    boolean isWithinY(){
        return super.y >= bY1 && super.y <= bY2;
    }


    void changeDirection() {

        // if x goes out of bounds to the left
        if ( super.x < bX1 && isWithinY() ) {
            int r = int(floor(random(0.00, 3.00)));
            switch(r) {
                case 0:
                    initDirection = 0;
                    break;
                case 1: 
                    initDirection = 5;
                    break;
                case 2:
                    initDirection = 4;
            }
            // forward
            // bottom right
            // top right
        } 

        // if x goes out of bounds to the right
     if ( super.x > bX2 && isWithinY() ) {
            int r = int(floor(random(0.00, 3.00)));
            switch(r) {
                case 0:
                    initDirection = 1;
                    break;
                case 1: 
                    initDirection = 7;
                    break;
                case 2:
                    initDirection = 6;
            }
            // backward
            // bottom left
            // top left
        }

        // if y goes out of bounds to the top
     if ( super.y < bY1 && isWithinX() ) {
            int r = int(floor(random(0.00, 3.00)));
            switch(r) {
                case 0:
                    initDirection = 3;
                    break;
                case 1: 
                    initDirection = 5;
                    break;
                case 2:
                    initDirection = 7;
            }
            // descend
            // bottom right
            // bottom left
        }

        // if y goes out of bounds to the bottom
     if ( super.y > bY2 && isWithinX() ) {
            int r = int(floor(random(0.00, 3.00)));
            switch(r) {
                case 0:
                    initDirection = 2;
                    break;
                case 1: 
                    initDirection = 4;
                    break;
                case 2:
                    initDirection = 6;
            }
            // ascend
            // top right
            // top left
        }

        // if out of bounds to the bottom left corner
     if ( super.y > bY2 && super.x < bX1 ) {
            // top right
            initDirection = 4;
        }

        // if out of bounds to the bottom right corner
     if ( super.y > bY2 && super.x > bX2 ) {
            // top left
            initDirection = 6;
        }

        // if out of bounds to the top left
     if ( super.x < bX1 && super.y < bY1 ) {
            // bottom right
            initDirection = 5;
        }
        // if out bounds to the top right
        // if x > bx2 && y < bY1
        if (super.x > bX2 && super.y < bY1) {
            //bottom left
            initDirection = 7;
        }   
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
