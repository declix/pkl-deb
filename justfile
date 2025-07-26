test:
    pkl test

package:
    pkl project package --output-path dist

clean:
    rm -rf dist/

check: test package