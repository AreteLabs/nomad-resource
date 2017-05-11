# Nomad Resource  

Concourse resource for deploying Nomad jobs using Concourse.

## Installing

```
resource_types:
- name: nomad
  type: docker-image
  source:
    repository: aretelabs/nomad-resource
resources:
- name: loadbalancer
  type: nomad
  source:
    url: https://hostname:port
    name: test
```

## Source Configuration

* `url`: *Required.* URL to Nomad.
* `name`: *Required.* Name of Nomad job.

#### `out`: Begins Nomad Deploy Process

Applies a nomad action.

#### Parameters
* `job_path`: *Required.* Path to file for nomad job.

## Example

### Out
```
---
resources:
- name: loadbalancer
  type: nomad
  source:
    url: https://hostname:port
    name: test
```

```
---
- put: loadbalancer
  params:
    job_path: lb/lb.hcl
```
