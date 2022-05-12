class: Workflow
cwlVersion: v1.0

inputs:
  bed_file:
    type: File
  output_fn:
    type: string?

steps:
  sort:
    run: sort.cwl
    in:
      unsorted_bed: bed_file
    out:
      - sorted_bed

  merge:
    run: merge.cwl
    in:
      sorted_bed: sort/sorted_bed
      output_fn: output_fn
    out:
      - merged_bed

outputs:
  merged_bed:
    type: File
    outputSource: merge/merged_bed
