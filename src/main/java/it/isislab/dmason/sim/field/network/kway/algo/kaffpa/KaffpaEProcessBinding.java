package it.isislab.dmason.sim.field.network.kway.algo.kaffpa;

import java.io.IOException;

import it.isislab.dmason.annotation.AuthorAnnotation;
import it.isislab.dmason.sim.field.network.kway.algo.interfaces.PartitioningAlgorithm;

@AuthorAnnotation(
		author = {"Alessia Antelmi", "Carmine Spagnuolo"},
		date = "22/7/2015"
		)
public class KaffpaEProcessBinding implements PartitioningAlgorithm {

	/**
	 * @param bin_path - bin path of the executable
	 * @param graph_path - path of the graph to partition
	 * @param K - number of partitions
	 */
	public KaffpaEProcessBinding(String bin_path, String graph_path, int K) {
		this.bin_path = bin_path;
		this.graph_path = graph_path;
		this.nPart = K;
	}

	@Override
	public String partitioning() throws IOException, InterruptedException {
		String output_file = graph_path + ".part." + nPart;
		Process part = Runtime.getRuntime().exec(
				bin_path + " " + graph_path + " " + nPart
						+ " --output_filename=" + output_file);
		int status = part.waitFor();

		if (status != 0) {
			System.err.println("Error in calling kaffpaE!");
			System.exit(0);
		}

		return output_file;
	}

	private String graph_path;
	private String bin_path;
	private Integer nPart;
}