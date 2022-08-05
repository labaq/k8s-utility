看到大大的文章說明如何移除 terminating 的 namespace

[移除該死的Terminating Namespace](https://medium.com/%E8%BC%95%E9%AC%86%E5%B0%8F%E5%93%81-pks%E8%88%87k8s%E7%9A%84%E9%BB%9E%E6%BB%B4/%E7%A7%BB%E9%99%A4%E8%A9%B2%E6%AD%BB%E7%9A%84terminating-namespace-c6594ebe351)

不過我在使用上時碰到了另外的情境，finalizers 的字段居然出現在其他的地方．．．除了 .spec.finalizers 之外也出現在 .metadata.finalizers
