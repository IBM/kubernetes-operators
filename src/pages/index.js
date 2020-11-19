import React from 'react';
import clsx from 'clsx';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import useBaseUrl from '@docusaurus/useBaseUrl';
import styles from './styles.module.css';

const features = [
  {
    title: 'Kubernetes',
    imageUrl: 'img/kubernetes-icon.png',
    description: (
      <>
        Kubernetes is open-source orchestration software for deploying, managing, and scaling containers. IBM and Red Hat have been core contributors to Kubernetes from the beginning, and OpenShift is a secure enterpise extension of plain Kubernetes. To learn more about Kubernetes and OpenShift go to our <a href="https://github.com/IBM/kube101/tree/master/workshop" target="_blank">Kubernetes lab</a>.
      </>
    ),
  },
  {
    title: 'Operator Framework',
    imageUrl: 'img/operator-framework-icon.png',
    description: (
      <>
        Operators are a cloud native way to manage the lifecycle of a deployment on Kubernetes. This lab will step you through the creation of operators using the Operator SDK. The <a href="https://sdk.operatorframework.io/" target="_blank">Operator SDK</a> provides the tools to build, test, and package Operators and is part of the Operator Framework. Click <a href="docs/labs/lab1">Get Started</a> to begin with the lab.
      </>
    ),
  },
  {
    title: 'IBM Developer',
    imageUrl: 'img/ibmrebusclassic.svg',
    description: (
      <>
        At IBM Developer, we love open source and we love developers. IBM has been a longtime supporter of open source, a few projects we support are: Nodejs, Loopback, Linux, Kubernetes, Istio, Qiskit, Tensorflow, OpenSCAP, and Ansible. We are also core members of the Linux Foundation, OpenJS Foundation, Cloud Native Computing Foundation (CNCF), and the Apache Software Foundation to name a few. Find out what else we do at <a href="https://developer.ibm.com/technologies/containers/" target="_blank">IBM Developer</a>.
      </>
    ),
  }
];

function Feature({imageUrl, title, description}) {
  const imgUrl = useBaseUrl(imageUrl);
  return (
    <div className={clsx('col col--4', styles.feature)}>
      {imgUrl && (
        <div className="text--center">
          <img className={styles.featureImage} src={imgUrl} alt={title} />
        </div>
      )}
      <h3>{title}</h3>
      <p>{description}</p>
    </div>
  );
}

function Home() {
  const context = useDocusaurusContext();
  const {siteConfig = {}} = context;
  return (
    <Layout
      title={`Hello from ${siteConfig.title}`}
      description="Description will go into a meta tag in <head />">
      <header className={clsx('hero hero--primary', styles.heroBanner)}>
        <div className="container">
          <h1 className="hero__title">{siteConfig.title}</h1>
          <p className="hero__subtitle">{siteConfig.tagline}</p>
          <div className={styles.buttons}>
            <Link
              className={clsx(
                'button button--outline button--secondary button--lg',
                styles.getStarted,
              )}
              to={useBaseUrl('docs/labs/lab1')}>
              Get Started
            </Link>
          </div>
        </div>
      </header>
      <main>
        {features && features.length > 0 && (
          <section className={styles.features}>
            <div className="container">
              <div className="row">
                {features.map((props, idx) => (
                  <Feature key={idx} {...props} />
                ))}
              </div>
            </div>
          </section>
        )}
      </main>
    </Layout>
  );
}

export default Home;
