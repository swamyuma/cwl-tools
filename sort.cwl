class: CommandLineTool
cwlVersion: v1.0

requirements:
  DockerRequirement:
    dockerPull: bedtools-image:latest
  ResourceRequirement:
    ramMax: 1000


inputs:
  unsorted_bed:
    type: File
    inputBinding:
      prefix: -i

  output_fn:
    type: string
    default: sorted.bed

outputs:
  sorted_bed:
    type: stdout

stdout: $(inputs.output_fn)

baseCommand: ["bedtools", "sort"]
