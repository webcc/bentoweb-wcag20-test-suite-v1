# WCAG 2.0 Test Suite (First Version): June 30th 2005 Working Draft

This Test Suite is a set of XHTML + CSS test cases mapped to the [30 June 2005 Working Draft of WCAG 2.0](http://www.w3.org/TR/2005/WD-WCAG20-20050630/). Some success criteria in that draft were unfinished or open to interpretation. Newer drafts changed, moved, deleted or split success criteria, introduced new success criteria, adopted another numbering system, etc. This also means that the mapping of the test cases to success criteria in the final WCAG 2.0 recommendation may be different from this one. This Test Suite is in the public domain and subject to the licensing conditions set forth in the BenToWeb Public License This test suite is superseded by the third version of the test suite.

The XHTML + CSS test suite contains over 470 test cases and over 500 test files. Each test case covers one success criterion, with at least one test that fails the success criterion and at least one that passes. The test files use XHTML 1.0. CSS 2.x is also used where this is relevant to the success criterion.

There are several types of test cases:

+ simple test cases use one file to test one success criterion;
+ compound test cases use multiple files to test one success criterion; and
+ complex test cases use one or more files to test multiple success criteria.

This Test Suite does not contain complex test cases, even though a test case that is intended to pass a certain success criterion may fail another success criterion that is not relevant to the test. The test case metadata (written in a specific XML vocabulary developed for this purpose, Test Case Description Language TCDL) provide a means to explicitly indicate that some other specific success criteria are not relevant to a test case. For example: a test case for blinking content (Guideline 2.2 Level 2 Success Criterion 1 in WCAG 2.0) might use the <blink> element, which is not valid XHTML; in this case, the metadata can indicate that validation is not a relevant criterion for the test.
