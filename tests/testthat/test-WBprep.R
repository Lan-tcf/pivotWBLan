test_that("Years are formatted correctly", {
  expect_setequal(WBprep(maternal_mortality, "maternal_mortality")$year, 2000:2019)
  expect_setequal(colnames(WBprep(maternal_mortality, "maternal_mortality")),
                  c("iso","year","maternal_mortality"))
})
