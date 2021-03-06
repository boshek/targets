# Use sparingly. We do not want to max out any AWS quotas.
# After this test runs, log into the AWS console,
# check that the prefix is correct, and MANUALLY CLEAR OUT THE BUCKET.
tar_test("aws_parquet format returns data frames", {
  skip_if_no_aws()
  skip_if_not_installed("arrow")
  bucket_name <- random_bucket_name()
  aws.s3::put_bucket(bucket = bucket_name)
  expr <- quote({
    tar_option_set(
      resources = tar_resources(
        aws = tar_resources_aws(
          bucket = !!bucket_name,
          prefix = "custom/prefix"
        )
      ),
      format = "aws_parquet"
    )
    list(
      tar_target(x, data.frame(x = seq_len(2), y = seq_len(2)))
    )
  })
  expr <- tar_tidy_eval(expr, environment(), TRUE)
  eval(as.call(list(`tar_script`, expr, ask = FALSE)))
  tar_make(callr_function = NULL)
  out <- tar_read(x)
  expect_equal(out, data.frame(x = seq_len(2), y = seq_len(2)))
})
