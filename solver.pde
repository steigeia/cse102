double[][] rref(double [][] m) /*1, modified*/
{
  int lead = 0;
  int rowCount = m.length;
  int colCount = m[0].length;
  int i;
  boolean quit = false;

  for (int row = 0; row < rowCount && !quit; row++)
  {
    //print(m);
    //println("");

    if (colCount <= lead)
    {
      quit = true;
      break;
    }

    i=row;

    while (!quit && m[i][lead] == 0)
    {
      i++;
      if (rowCount == i)
      {
        i=row;
        lead++;

        if (colCount == lead)
        {
          quit = true;
          break;
        }
      }
    }

    if (!quit)
    {
      swapRows(m, i, row);

      if (m[row][lead] != 0)
        multiplyRow(m, row, 1.0f / m[row][lead]);

      for (i = 0; i < rowCount; i++)
      {
        if (i != row)
          subtractRows(m, m[i][lead], row, i);
      }
    }
    lead++;
  }
  return m;
}

// swaps two rows
void swapRows(double [][] m, int row1, int row2)
{
  double [] swap = new double[m[0].length];

  for (int c1 = 0; c1 < m[0].length; c1++)
    swap[c1] = m[row1][c1];

  for (int c1 = 0; c1 < m[0].length; c1++)
  {
    m[row1][c1] = m[row2][c1];
    m[row2][c1] = swap[c1];
  }
}

void multiplyRow(double [][] m, int row, double scalar)
{
  for (int c1 = 0; c1 < m[0].length; c1++)
    m[row][c1] *= scalar;
}

void subtractRows(double [][] m, double scalar, int subtract_scalar_times_this_row, int from_this_row)
{
  for (int c1 = 0; c1 < m[0].length; c1++)
    m[from_this_row][c1] -= scalar * m[subtract_scalar_times_this_row][c1];
}

void print(double [][] matrix)
{
  for (int c1 = 0; c1 < matrix.length; c1++)
  {
    print("[ ");

    for (int c2 = 0; c2 < matrix[0].length-1; c2++)
      print(matrix[c1][c2] + ", ");

    println(matrix[c1][matrix[c1].length-1] + " ]");
  }
}