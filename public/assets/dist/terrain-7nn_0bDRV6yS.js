//public interface Render {
//  /**
//   * drawContour - interface for implementing the user supplied method to
//   * render the countours.
//   *
//   * Draws a line between the start and end coordinates.
//   *
//   * @param startX    - start coordinate for X
//   * @param startY    - start coordinate for Y
//   * @param endX      - end coordinate for X
//   * @param endY      - end coordinate for Y
//   * @param contourLevel - Contour level for line.
//   */
//  public  void drawContour(double startX, double startY, double endX, double endY, double contourLevel);
//}
class Renderer {
    MAGNITUDE = 20;
    drawContour(startX, startY, endX, endY, contourLevel) {
        //strokeWeight((int)contourLevel * 2.057721);
        //if(contourLevel == 1.0) {
        //  strokeWeight(5);
        //} else if (contourLevel == 5.0) {
        //  strokeWeight(1);
        //}
        //else {
        // strokeWeight(2.5);
        //}
        let from = color(237, 84, 102);
        let to = color(244, 208, 99);
        let c = lerpColor(from, to, startX / (width / this.MAGNITUDE)); //color[] colors = {
        //  color(15),
        //  color(25),
        //  color(35),
        //  color(45),
        //  color(55),
        //  color(65),
        //  color(75),
        //  color(75),
        //  color(95),
        //  color(115),
        //  color(135),
        //  color(155),
        //  color(175),
        //  color(195),
        //  color(205),
        //  color(215),
        //  color(235),
        //  color(255)
        //};
        //color[] colors = {
        //  color(255 - 255),
        //  color(255 - 235),
        //  color(255 - 215),
        //  color(255 - 205),
        //  color(255 - 195),
        //  color(255 - 175),
        //  color(255 - 155),
        //  color(255 - 135),
        //  color(255 - 115),
        //  color(255 - 95),
        //  color(255 - 75),
        //  color(255 - 75),
        //  color(255 - 65),
        //  color(255 - 55),
        //  color(255 - 45),
        //  color(255 - 35),
        //  color(255 - 25),
        //  color(255 - 15),
        //};
        //float i = (float) contourLevel * 2.057721;
        //stroke(127 + 127 * sin((i/10) * 0.05),
        //    127 + 127 * sin((i/20) * 0.003),
        //    127 + 127 * sin((i/10) * 0.009)
        //);
        //stroke(colors[(int)contourLevel]);
        stroke(20); //stroke(c);
        line(
            startX * this.MAGNITUDE,
            startY * this.MAGNITUDE,
            endX * this.MAGNITUDE,
            endY * this.MAGNITUDE
        ); //fill(20);
        //line((float)endX * MAGNITUDE, (float)startY * MAGNITUDE, (float)startX * MAGNITUDE, (float)endY * MAGNITUDE);
        //point((float)startX * MAGNITUDE, (float)endY * MAGNITUDE);
        //point((float)endX * MAGNITUDE, (float)startY * MAGNITUDE);
    }
}
class Conrec {
    h = new Array(5);
    sh = new Array(5);
    xh = new Array(5);
    yh = new Array(5); // Object that knows how to draw the contour
    renderer = null; /** Creates new Conrec */
    constructor(renderer) {
        this.renderer = renderer;
    }
    /**
     *     contour is a contouring subroutine for rectangularily spaced data
     *
     *     It emits calls to a line drawing subroutine supplied by the user
     *     which draws a contour map corresponding to real*4data on a randomly
     *     spaced rectangular grid. The coordinates emitted are in the same
     *     units given in the x() and y() arrays.
     *
     *     Any number of contour levels may be specified but they must be
     *     in order of increasing value.
     *
     *
     * @param d  - matrix of data to contour
     * @param ilb,iub,jlb,jub - index bounds of data matrix
     *
     *             The following two, one dimensional arrays (x and y) contain the horizontal and
     *             vertical coordinates of each sample points.
     * @param x  - data matrix column coordinates
     * @param y  - data matrix row coordinates
     * @param nc - number of contour levels
     * @param z  - contour levels in increasing order.
     *
     */
    contour(d, ilb, iub, jlb, jub, x, y, nc, z) {
        let m1;
        let m2;
        let m3;
        let case_value;
        let dmin;
        let dmax;
        let x1 = 0.0;
        let x2 = 0.0;
        let y1 = 0.0;
        let y2 = 0.0;
        let i;
        j;
        k;
        m; // The indexing of im and jm should be noted as it has to start from zero
        // unlike the fortran counter part
        let im = [0, 1, 1, 0];
        let jm = [0, 0, 1, 1]; // Note that castab is arranged differently from the FORTRAN code because
        // Fortran and C/C++ arrays are transposed of each other, in this case
        // it is more tricky as castab is in 3 dimension
        let castab = [
            [
                [0, 0, 8],
                [0, 2, 5],
                [7, 6, 9],
            ],
            [
                [0, 3, 4],
                [1, 3, 1],
                [4, 3, 0],
            ],
            [
                [9, 6, 7],
                [5, 2, 0],
                [8, 0, 0],
            ],
        ];
        for (j = jub - 1; j >= jlb; j--) {
            for (i = ilb; i <= iub - 1; i++) {
                let temp1;
                temp2;
                temp1 = Math.min(d[i][j], d[i][j + 1]);
                temp2 = Math.min(d[i + 1][j], d[i + 1][j + 1]);
                dmin = Math.min(temp1, temp2);
                temp1 = Math.max(d[i][j], d[i][j + 1]);
                temp2 = Math.max(d[i + 1][j], d[i + 1][j + 1]);
                dmax = Math.max(temp1, temp2);
                if (dmax >= z[0] && dmin <= z[nc - 1]) {
                    for (k = 0; k < nc; k++) {
                        if (z[k] >= dmin && z[k] <= dmax) {
                            for (m = 4; m >= 0; m--) {
                                if (m > 0) {
                                    // The indexing of im and jm should be noted as it has to
                                    // start from zero
                                    this.h[m] =
                                        d[i + im[m - 1]][j + jm[m - 1]] - z[k];
                                    this.xh[m] = x[i + im[m - 1]];
                                    this.yh[m] = y[j + jm[m - 1]];
                                } else {
                                    this.h[0] =
                                        0.25 *
                                        (this.h[1] +
                                            this.h[2] +
                                            this.h[3] +
                                            this.h[4]);
                                    this.xh[0] = 0.5 * (x[i] + x[i + 1]);
                                    this.yh[0] = 0.5 * (y[j] + y[j + 1]);
                                }
                                if (this.h[m] > 0.0) {
                                    this.sh[m] = 1;
                                } else if (this.h[m] < 0.0) {
                                    this.sh[m] = -1;
                                } else this.sh[m] = 0;
                            } //
                            // Note: at this stage the relative heights of the corners and the
                            // centre are in the h array, and the corresponding coordinates are
                            // in the xh and yh arrays. The centre of the box is indexed by 0
                            // and the 4 corners by 1 to 4 as shown below.
                            // Each triangle is then indexed by the parameter m, and the 3
                            // vertices of each triangle are indexed by parameters m1,m2,and
                            // m3.
                            // It is assumed that the centre of the box is always vertex 2
                            // though this is// [processing-p5-convert] important only when all 3 vertices lie exactly on
                            // the same contour level, in which case only the side of the box
                            // is drawn.
                            //
                            //
                            //      vertex 4 +-------------------+ vertex 3
                            //               | \               / |
                            //               |   \    m-3    /   |
                            //               |     \       /     |
                            //               |       \   /       |
                            //               |  m=2    X   m=2   |       the centre is vertex 0
                            //               |       /   \       |
                            //               |     /       \     |
                            //               |   /    m=1    \   |
                            //               | /               \ |
                            //      vertex 1 +-------------------+ vertex 2
                            //
                            //
                            //
                            //               Scan each triangle in the box
                            //
                            for (m = 1; m <= 4; m++) {
                                m1 = m;
                                m2 = 0;
                                if (m != 4) {
                                    m3 = m + 1;
                                } else {
                                    m3 = 1;
                                }
                                case_value =
                                    castab[this.sh[m1] + 1][this.sh[m2] + 1][
                                        this.sh[m3] + 1
                                    ];
                                if (case_value != 0) {
                                    switch (case_value) {
                                        case 1: // Line between vertices 1 and 2
                                            x1 = this.xh[m1];
                                            y1 = this.yh[m1];
                                            x2 = this.xh[m2];
                                            y2 = this.yh[m2];
                                            break;
                                        case 2: // Line between vertices 2 and 3
                                            x1 = this.xh[m2];
                                            y1 = this.yh[m2];
                                            x2 = this.xh[m3];
                                            y2 = this.yh[m3];
                                            break;
                                        case 3: // Line between vertices 3 and 1
                                            x1 = this.xh[m3];
                                            y1 = this.yh[m3];
                                            x2 = this.xh[m1];
                                            y2 = this.yh[m1];
                                            break;
                                        case 4: // Line between vertex 1 and side 2-3
                                            x1 = this.xh[m1];
                                            y1 = this.yh[m1];
                                            x2 = this.xsect(m2, m3);
                                            y2 = this.ysect(m2, m3);
                                            break;
                                        case 5: // Line between vertex 2 and side 3-1
                                            x1 = this.xh[m2];
                                            y1 = this.yh[m2];
                                            x2 = this.xsect(m3, m1);
                                            y2 = this.ysect(m3, m1);
                                            break;
                                        case 6: //  Line between vertex 3 and side 1-2
                                            x1 = this.xh[m3];
                                            y1 = this.yh[m3];
                                            x2 = this.xsect(m1, m2);
                                            y2 = this.ysect(m1, m2);
                                            break;
                                        case 7: // Line between sides 1-2 and 2-3
                                            x1 = this.xsect(m1, m2);
                                            y1 = this.ysect(m1, m2);
                                            x2 = this.xsect(m2, m3);
                                            y2 = this.ysect(m2, m3);
                                            break;
                                        case 8: // Line between sides 2-3 and 3-1
                                            x1 = this.xsect(m2, m3);
                                            y1 = this.ysect(m2, m3);
                                            x2 = this.xsect(m3, m1);
                                            y2 = this.ysect(m3, m1);
                                            break;
                                        case 9: // Line between sides 3-1 and 1-2
                                            x1 = this.xsect(m3, m1);
                                            y1 = this.ysect(m3, m1);
                                            x2 = this.xsect(m1, m2);
                                            y2 = this.ysect(m1, m2);
                                            break;
                                        default:
                                            break;
                                    } // Put your processing code here and comment out the printf
                                    //print("%f %f %f %f %f\n",x1,y1,x2,y2,z[k]);
                                    this.renderer.drawContour(
                                        x1,
                                        y1,
                                        x2,
                                        y2,
                                        z[k]
                                    );
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    xsect(p1, p2) {
        return (
            (this.h[p2] * this.xh[p1] - this.h[p1] * this.xh[p2]) /
            (this.h[p2] - this.h[p1])
        );
    }
    ysect(p1, p2) {
        return (
            (this.h[p2] * this.yh[p1] - this.h[p1] * this.yh[p2]) /
            (this.h[p2] - this.h[p1])
        );
    }
}
let LIMIT = 200;
let x = new Array(LIMIT);
let y = new Array(LIMIT);
let d = Array.from(new Array(LIMIT - 1), () => new Array(LIMIT - 1));
let renderer = new Renderer();
let ilb = 0;
let iub = 100;
let jlb = 0;
let jub = 100;
let nc = 10;
let z = [
    1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0,
    15.0, 16.0, 17.0,
];
let t;
function setup() {
    //size(6500, 6500);
    createCanvas(1024, 1024);
    for (let i = 0; i < LIMIT; i++) {
        x[i] = i;
        y[i] = i;
    } //   frameRate(1);
}
function draw() {
    //   noFill();
    //   background(color(89, 191, 237));
    background(255); //   stroke(255);
    for (let i = 0; i < LIMIT - 1; i++) {
        for (let k = 0; k < LIMIT - 1; k++) {
            //float p_noise = noise(t);
            //float p_noise = noise(t) * i * k;
            //float p_noise = noise(t * k) + (10 * cos(k) * i) * (10 * sin(k / 20) * i);
            //float p_noise = noise(t + i) * (10 * cos(k * i)) * (2 * sin(k) * k);
            let p_noise = noise(i * k) * (2 * cos(k * i)) * (5 * sin(t) * k); //float p_noise = (noise(t * k ) / i);
            //float p_noise = noise(t *  i * k);
            //float p_noise = noise(t *  i) * (k * k);
            d[i][k] = PI * (sin(p_noise / k) + cos(p_noise)); //d[i][k] = (mouseY * sin(p_noise / k) + cos(i / (mouseX + 1)));
            //d[i][k] = (mouseY / 200.0) * (sin(p_noise * (mouseX / 200.0)));
            //d[i][k] = sin(p_noise * PI) * PI + k;
            //print(mouseY);
            //print("/n");
            //d[i][k] = (i * mouseY) * (p_noise / k); // water
            //d[i][k] = (18 - (p_noise + (mouseY / 200.0) )) * mouseX / 200.0;
            //d[i][k] = random(0,10);
        }
    }
    let c = new Conrec(renderer);
    c.contour(d, ilb, iub, jlb, jub, x, y, nc, z); //t = t + 0.005;
    t = second(); //String color_names = from_r + "-" + from_g + "-" + from_b + "--" + to_r + "-"+ to_g + "-"+ to_b;
    //saveFrame("terrain-black-large-outline-2-"+t+"-######.png");
}
