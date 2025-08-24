from setuptools import setup
import os
from glob import glob

package_name = 'tcc'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        ('share/' + package_name, ['package.xml']),
    	(os.path.join('share', package_name, 'resource'), ['resource/' + package_name]),
    	(os.path.join('share', package_name, 'launch'), glob('launch/*.py')),
    	(os.path.join('share', package_name, 'worlds'), glob('worlds/*.world')),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Your Name',
    maintainer_email='your@email.com',
    description='Minimal Gazebo launch package',
    license='Apache License 2.0',
    entry_points={
        'console_scripts': [
            'turtlebot3_absolute_move_Arena = tcc.turtlebot3_absolute_move_Arena:main',
        ],
    },
)

