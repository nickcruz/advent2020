// Created by nick_cruz on 11/30/20.
// Copyright © 2020 Airbnb Inc. All rights reserved.

import Foundation

// https://adventofcode.com/2020/day/1

let example = [1721,979,366,299,675,1456] // solution: 1721 + 299 = 2020, 1721 * 299 = 514279
let example2 = [1, 2, 2019, 2020]

let puzzleInput = [1946,1859,1654,1806,1648,1873,1216,1831,1610,1779,1626,1332,1713,1919,1353,1720,1818,1976,1993,1617,1678,1655,1725,1686,1737,1696,1046,1814,1909,1618,2006,1903,1528,1635,1457,1924,1734,1723,1735,1984,1846,1921,1587,2009,1607,1987,1910,1571,1898,1869,1537,1446,1535,1802,1847,1966,1944,1793,1383,1850,1274,347,1208,1748,1906,1771,1849,1773,1792,1705,1538,1564,2003,1994,1545,1704,1657,1483,1701,1724,1293,1834,1712,1950,1844,1290,1692,1820,1585,1986,1328,1841,1709,1232,1945,1684,1787,1991,1914,16,1977,1620,1825,1866,1615,1832,496,1932,1819,1559,1870,1677,1650,1594,1664,1600,1622,1862,1937,1624,1580,1931,1803,1839,1755,1952,1473,1694,1864,1178,1163,1790,393,1776,1871,1999,1923,1174,1557,1646,1200,1842,1432,1573,1913,1954,1599,1980,1948,1430,1298,1835,1643,1742,1609,1649,1382,1343,1263,1908,1703,1922,1764,1603,1330,588,954,1772,1553,975,1499,1552,1214,1829,1698,1797,1807,1961,1947,1845,1881,1821,1815,1623,1675,1478,1886,1951,1700,1890,1876,1781,1853,1983,1901,1939,1292,853,1879,1652]


func day1Test() {
  let product = findEntriesAndMultiply(entries: example2)
  print("\(product)")
}

func day1() {
  let product = findEntriesAndMultiply(entries: puzzleInput)
  print("\(product)")
}

func printNoEntries(findSum: Int) -> Int {
  print("Unable to find entries that sum to \(findSum).")
  return -1
}

// Returns -1 if invalid
func check(_ entries: [Int], _ i: Int, _ j: Int, _ findSum: Int) -> Int {
  if (i >= j) {
    return -1
  }

  if (i < 0 || entries.count <= i || j < 0 || entries.count <= j) {
    return -1
  }

  let start = entries[i]
  let end = entries[j]
  let sum = start + end
  if (sum == findSum) {
    print("Entries \(start) and \(end) sum to \(findSum). Their product is:")
    return start * end
  } else {
    return 0
  }
}

func findEntriesAndMultiply(entries: [Int], findSum: Int = 2020) -> Int {
  // Sort entries
  let entries = entries.sorted()
  print(entries)

  if (entries.count < 2) {
    print("Not enough entries.")
    return -1
  }

  // have 1 pointer at each end, then converge
  var i = 0
  var j = entries.endIndex - 1
  while (i < j) {
    let product = check(entries, i, j, findSum)
    if (product == 0) {
      // keep checking


      // TODO(nick.cruz): Fix the increment logic
      let i2 = i + 1
      let j2 = j - 1
      let productLeft = check(entries, i2, j, findSum)
      let productRight = check(entries, i, j2, findSum)
      if (productLeft > 0) {
        return productLeft
      }
      if (productRight > 0) {
        return productRight
      }
      i = i2
      j = j2


      continue
    } else if (product == -1) {
      return printNoEntries(findSum: findSum)
    }
    return product
  }

  return printNoEntries(findSum: findSum)
}
