class: CommandLineTool
cwlVersion: v1.0

label: Sort input bed file

requirements:
  DockerRequirement:
    dockerPull: bedtools-image:latest
  ResourceRequirement:
    ramMax: 1000


inputs:
  unsorted_bed:
    label: input bed file
    type: File
    inputBinding:
      prefix: -i

  output_fn:
    label: output sorted bed file
    type: string
    default: sorted.bed

outputs:
  sorted_bed:
    type: stdout

stdout: $(inputs.output_fn)

baseCommand: ["bedtools", "sort"]
