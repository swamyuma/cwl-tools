class: Workflow
cwlVersion: v1.0

label: Sort and merge input bed file and generate a .sorted.merged.bed file

inputs:
  bed_file:
    label: input bed file
    type: File
  output_fn:
    label: output sorted and merged bed file
    type: string?

steps:
  sort:
    doc: first step in the workflow is to sort the input bed file
    run: sort.cwl
    in:
      unsorted_bed: bed_file
    out:
      - sorted_bed

  merge:
    doc: second step in the workflow is to merge the sorted bed file from step1
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
