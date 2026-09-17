2D matrices are stored in memory as a 1D array.

To access element [i][j]:

    index = i * N + j

where:

- i = row

- j = column

- N = number of columns

i * N → skip all elements in the rows before row i

+ j   → move j positions across that row

Example: 3×4 matrix, A[2][1]

    2 * 4 + 1 = 9

So A[2][1] is stored at index 9.

Therefore:

    A[i][j] → A[i * N + j]





Example: a 3 × 4 matrix

        0   1   2   3

      ┌───┬───┬───┬───┐

  0   │   │   │   │   │

      ├───┼───┼───┼───┤

  1   │   │   │   │   │

      ├───┼───┼───┼───┤

  2   │   │ X │   │   │

      └───┴───┴───┴───┘

          ↑

        A[2][1]

There are 4 columns (N = 4).

To find A[2][1]:

    i * N + j

    2 * 4 + 1

    = 9

So A[2][1] is stored at index 9 in the flat array.